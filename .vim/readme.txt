1. 必须要先安装Git
2. 把这.vimrc .vim 覆盖原先的　~下面的文件

vim74
vim 重新编译命令
./configure --prefix=/usr --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-luainterp --with-lua-prefix=/usr/local --with-python-config-dir=/usr/lib/python2.7/config



1. YoucompleteMe 插件需要手动安装

  git submodule update --init --recursive
  ./install.sh --clang-completer  //　这个是安装C语言的，　php 的好像还没有

2. tabular
   对齐的

3. ctags 手动安装

4. vim-airline 
方法在  http://chinacheng.iteye.com/blog/1935564
 需要添加补丁字体
 https://github.com/Lokaltog/powerline-fonts 

#字体复制到下面这个目录（或者自定义）  
~/.fonts/   
#执行下面命令，加载字体  
fc-cache -vf ~/.fonts  
#第三步：设置terminal字体，打开terminal -> 编辑 -> 配置文件首选项 -> 常规 -> 选择新添加的powerline的字体  



ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q  -f ~/.vim/systags /usr/include/* /usr/include/sys/* /usr/include/bits/*  /usr/include/netinet/* /usr/include/arpa/* /usr/local/mysql/include/* 










解决python>2.7 问题
sudo apt-get install python-dev
sudo apt-get install gettext


vim 重新编译命令
./configure --prefix=/usr --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-luainterp --with-lua-prefix=/usr/local --with-python-config-dir=/usr/lib/python2.7/config



解决python>2.7 问题
sudo apt-get install python-dev
sudo apt-get install gettext


http://www.cnblogs.com/spch2008/p/4593370.html
http://www.cnblogs.com/spch2008/p/4593372.html


先安装readline
ncurses


lua 安装
make linux
sudo make install
