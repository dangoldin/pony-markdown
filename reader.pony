use "files"

class Reader
    let _file: File

    new create(file: File iso) =>
        _file = consume file

    fun ref read(): String =>
        let buffer: Array[U8] iso = recover iso Array[U8].create() end
        while _file.errno() is FileOK do
            buffer.append(_file.read(1024))
        end
        String.from_array(consume buffer)
