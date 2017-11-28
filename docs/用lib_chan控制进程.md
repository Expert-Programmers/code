lib_chan模块让用户能够显示控制自己的机器能分裂出哪些进程.

* -spec start_server() -> true

    它会在本地主机上启动一个服务器.
    这个服务器的行为由文件${HOME}/.erlang_config/lib_chan.conf决定.

* -spec start_server(Conf) -> true

    它会在本地主机上启动一个服务器.这个服务器的行为有文件Conf决定,它包含一个由下列
    形式的元祖所组成的列表:
    
    - {port, NNNN} 它会开始监听端口号NNNN
    - {service, S, password, P, mfa, SomeMod, SomeFunc, SomeArgsS}
    它会定义一个被密码P保护的服务S.如果这个服务启动了,就会通过分裂SomeMod:
    SomeFunc(MM, ArgsC, SomeArgsS)创建一个进程,负责处理来自客户端的消息.
    这里的MM是一个代理进程的PID,可以用来向客户端发送消息.参数ArgsC来自于客户端
    的连接调用.

* -spec connect(Host, Post, S, P, ArgsC) -> {ok, Pid} | {error, Why}

    尝试开启主机Host上的端口Port,然后尝试激活被密码保护的服务S.如果密码正确,
    就会返回{ok, Pid}.Pid是一个代理进程的标示符,可以用来向服务器发送消息.