## Unicode 码位是不是用 UInt16 就够了

Unicode 码位不完全适用于仅使用 `UInt16` 来表示。Unicode 码位范围从 U+0000 到 U+10FFFF，这需要 21 位来表示。而 `UInt16`（16 位无符号整数）的取值范围是 0 到 65535（0x0000 到 0xFFFF），只能表示 Basic Multilingual Plane (BMP) 中的字符，即 U+0000 到 U+FFFF 的码位。

为了表示所有 Unicode 码位，必须使用 `UInt32`（32 位无符号整数），其取值范围从 0 到 4294967295，可以涵盖所有 Unicode 码位。

具体解释如下：

1. **BMP 字符 (0x0000 - 0xFFFF)**:
   - 可以使用 `UInt16` 表示。
   - 涵盖了大部分常用字符，包括基本拉丁字符、汉字、和一些其他符号。

2. **Supplementary Planes (0x10000 - 0x10FFFF)**:
   - 超出了 `UInt16` 的表示范围。
   - 需要使用 `UInt32` 才能表示这些字符。

此外，UTF-16 编码（用于实际存储和传输 Unicode 字符的一种常见方式）使用一个或两个 16 位代码单元来表示 Unicode 字符。在 UTF-16 中，BMP 范围内的字符使用一个 16 位单元（即 `UInt16`），而补充平面的字符则使用一对 16 位单元（称为代理对，surrogate pair）。

总结来说，虽然 `UInt16` 足以表示 BMP 中的字符，但为了涵盖所有的 Unicode 码位，特别是包括补充平面的字符，`UInt32` 是必要的。
