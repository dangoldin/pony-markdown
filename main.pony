use "options"
use "files"

actor Main
    new create(env: Env) =>
        let options = Options(env.args)
        var inputFileName: String = "file.md"
        var outputFileName: String = "file.html"

        options
            .add("input", "i", StringArgument)
            .add("output", "o", StringArgument)

        for option in options do
            match option
                | ("input", let arg: String) =>  inputFileName = arg.string()
                | ("output", let arg: String) => outputFileName = arg.string()
                | let err: ParseError =>
                    err.report(env.out)
                    env.out.print(
                        """
                        pony-markdown [OPTIONS]
                        --output    name    string output filename.
                        --input     name    string input filename.
                        """
                    )
            end
        end

        env.out.print(inputFileName + " => " + outputFileName)

        try
            let auth = env.root as AmbientAuth
            let inputFile = recover File(FilePath(auth, inputFileName)?) end
            let reader = Reader(consume inputFile)
            let outputFile = recover File(FilePath(auth, outputFileName)?) end
            let writer = Writer(consume outputFile)
            let out = env.out
            let md = Markdown

            let s  = reader.read()
            let s' = md.markdownToHTML(s)
            writer.write(s')
        else
            env.err.print("Couldn't open files")
        end
