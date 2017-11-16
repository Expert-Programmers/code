- Pid =spwan(Mod,Func,Args) 
    
    创建一个新的进程来执行apply（Mod,Func,Args）,与调用进程并列运行，会使用最新的代码定义模块。
- Pid！Message 
    
    向Pid进程异步发送Message，！为发送操作符
- Receive … end 

    接收消息
    
    ```erlang
    receive
      Pattern1[when Guard1] ->
        Expression1;
      Pattern2[whenGuard2] ->
        Expression2;
      …
    end.
    ```