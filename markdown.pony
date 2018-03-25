use "regex"
use "collections/persistent"

class Markdown
    let _markdownRegexMap: Map[String, String]

    new create() =>
        _markdownRegexMap = Map[String, String].concat([
            ("(\\*)(.*?)\\1", "<em>$2</em>")
            ("(\\*\\*|__)(.*?)\\1", "<strong>$2</strong>")
            ].values())

    fun markdownToHTML(it: String): String =>
        var it' = it
        for mapPair in  _markdownRegexMap.pairs() do
            try
                let re = Regex(mapPair._1)?
                it' = re.replace(it', mapPair._2)?
            else
                it'
            end
        end
        it'
