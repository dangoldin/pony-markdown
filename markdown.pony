use "regex"

class Markdown
    fun markdownToHTML(it: String): String =>         
        try
            // let boldR = Regex("\\*.*?\\*")?
            let boldR = Regex("(\\*|_)(.*?)\\1")?
            boldR.replace(it, "<em>\\2</em>")?
        else
            it
        end
