use "files"
use "regex"

actor Writer
    let _file: File

    new create(file: File iso) =>
        _file = consume file

    be write(it: String) =>
        _file.write(it)
