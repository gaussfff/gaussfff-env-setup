#!/usr/bin/env fish 

function is_macos
    test (uname -s) = "Darwin"
end

function is_linux
    test (uname -s) = "Linux"
end

