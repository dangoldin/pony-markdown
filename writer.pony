use "files"

class Writer
    let _file: File

    new create(file: File iso) =>
        _file = consume file

    fun ref write(it: String) =>
        _file.write(it)
