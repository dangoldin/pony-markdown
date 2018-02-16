use "files"

actor Reader
    let _file: File

    new create(file: File iso) =>
        _file = consume file

    be read() =>
        _file.read(10)
