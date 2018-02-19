use "files"

actor Reader
    let _file: File
    var _buffer: Array[U8] ref

    new create(file: File iso) =>
        _file = consume file
        _buffer = recover ref Array[U8].create() end

    be read() =>
        // _file.read(10)
        while _file.errno() is FileOK do
            _buffer.append(_file.read(1024))
        end

    be getText() =>
        String.from_array(recover val _buffer end)
