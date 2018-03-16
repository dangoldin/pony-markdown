use "files"

actor Reader
    let _file: File

    new create(file: File iso) =>
        _file = consume file

    be read(fn: {(String)} val) =>
        let buffer: Array[U8] iso = recover iso Array[U8].create() end
        while _file.errno() is FileOK do
            buffer.append(_file.read(1024))
        end
        let s = String.from_array(consume buffer)
        let m = Markdown
        fn(m.markdownToHTML(s))
