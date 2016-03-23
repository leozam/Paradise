设置MYSQL的BLOB上传大小限制，否则插入大文件时MYSQL会报错！
set global max_allowed_packet = 2*1024*1024*3;(设置为6M)