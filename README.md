youdao-perl
===========

Youdao dict in perl.

有道词典 shell 版（perl 实现）

1.安装
依赖：
		1.LWP::Simple
		2.XML::Simple
使用 shell 命令，安装依赖模块
	 'cpan LWP::Simple XML::Simple'

2.申请 有道翻译API
	   网址：‘http://fanyi.youdao.com/openapi?path=data-mode’

	   并将所获的：
	   API_KEY, KEYFROM 填入 youdao-perl.ini 中的相应位置并保存文件即可。

3.使用
使用 shell 命令

	 'perl youdao-perl.pl ' + 英文单词（英文句子请用 ' 括起）

	 查询单词：
	 命令各式：perl ./youdao-perl.pl [words]
	 perl ./youdao-perl.pl abide abolish absurd
	 perl ./youdao-perl.pl bleach calibration

	 
	 查询句子：
	 perl ./youdao-perl.pl 'you are welcome