puts 'hello'

puts 'world'

#include <iostream>
#include <sys/socket.h>
#include <sys/epoll.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>

using namespace std;

#define MAXLINE 5
#define OPEN_MAX 100
#define LISTENQ 20
#define SERV_PORT 5000
#define INFTIM 1000

void setnonblocking(int sock)
{
        int opts;
        opts=fcntl(sock,F_GETFL);
        if(opts<0)
        {
                perror("fcntl(sock,GETFL)");
                exit(1);
        }
        opts = opts|O_NONBLOCK;
        if(fcntl(sock,F_SETFL,opts)<0)
        {
                perror("fcntl(sock,SETFL,opts)");
                exit(1);
        }
}
