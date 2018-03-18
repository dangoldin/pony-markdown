use "regex"
use "collections/persistent"

class Markdown
    let _markdownRegexMap: Map[Regex, String]

    new create() =>
        _markdownRegexMap = Map[Regex, String].concat([
            (Regex("(\\*)(.*?)(\\*)"), "<em>$2</em>")
            ].values())

    fun doBold(it: String): String =>
        try
            let boldR = Regex("(\\*)(.*?)(\\*)")?
            boldR.replace(it, "<em>$2</em>")?
        else
            it
        end

    fun markdownToHTML(it: String): String =>
        doBold(it)
