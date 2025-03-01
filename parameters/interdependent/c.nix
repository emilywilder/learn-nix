{
    writeShellScriptBin,
    b,
}:
writeShellScriptBin "hello" ''
    echo "Hello, ${b}!"
''