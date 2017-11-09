#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

void error(const char *msg)
{
    perror(msg);
    exit(0);
}

int main(int argc, char *argv[])
{
    socklen_t sockfd;
    struct sockaddr_in serv_addr;
    struct hostent *server;

    uint16_t portno;
    ssize_t n;

    char buffer[512];
    if (argc < 3)
    {
        fprintf(stderr,"usage %s hostname port\n", argv[0]);
        exit(0);
    }

    portno = (uint16_t)atoi(argv[2]);
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0)
    {
        error("ERROR opening socket");
    }

    server = gethostbyname(argv[1]);
    if (server == NULL)
    {
        fprintf(stderr,"ERROR, no such host\n");
        exit(0);
    }

    memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;

    memcpy(&serv_addr.sin_addr.s_addr, server->h_addr, sizeof(server->h_addr));
    serv_addr.sin_port = htons(portno);

    if (connect(sockfd,(struct sockaddr *) &serv_addr,sizeof(serv_addr)) < 0)
    {
        error("ERROR connecting");
    }

	/* If your message is a string
    printf("Please enter the message: ");
    memset(buffer, 0, sizeof(buffer));
    fgets(buffer,255,stdin);

    n = write(sockfd,buffer,strlen(buffer));
    if (n < 0)
    {
        error("ERROR writing to socket");
    }
	*/

	// Custom TCP packet
	buffer[0] = 0x00;
	buffer[1] = 0x01;

    memset(buffer, 0, sizeof(buffer));
    n = read(sockfd,buffer,255);
    if (n < 0)
    {
        error("ERROR reading from socket");
    }
    printf("%s\n",buffer);
    close(sockfd);

    return 0;
}
