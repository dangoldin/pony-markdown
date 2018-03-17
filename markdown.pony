use "regex"

class Markdown
    fun doBold(it: String): String =>
        try
            let boldR = Regex("\\*(.*?)\\*")?
            let matched = boldR(it)?
            boldR.replace(it, "<em>" + matched(1)? + "</em>")?
        else
            it
        end

    fun markdownToHTML(it: String): String =>
        doBold(it)
