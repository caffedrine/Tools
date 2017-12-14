/**
 * C++ Modbus RAW requests for very special moments!
 * Author: caffedrine@github
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

int main()
{
    // Define connection variables
    int srcPort = 1337;
    int destPort = 502;
    
    char srcAddr[] = "127.0.0.1";
    char destAddr[] = "127.0.0.1";
    
    // Socket variables
    socklen_t hSocket;
    struct sockaddr_in serv_addr;
    struct hostent *server;
    
    // Resolve hostname if any
    server = gethostbyname(destAddr);
    if(server == NULL)
    {
        fprintf(stderr, "ERROR, no such host\n");
        exit(1);
    }
    
    // Initialize socket structures
    memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    
    memcpy(&serv_addr.sin_addr.s_addr, server->h_addr, sizeof(server->h_addr));
    serv_addr.sin_port = htons((uint16_t) destPort);
    
    // Initialize socket handler
    hSocket = socket(AF_INET, SOCK_STREAM, 0);
    if(hSocket < 0)
    {
        fprintf(stderr, "Can't create socket handler...");
        exit(1);
    }
    
    // Connect to server
    if(connect(hSocket, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
    {
        fprintf(stderr, "Can't connect to server...");
        exit(1);
    }
    
    // Modbus MBAP + PDU packet
    char modbus_packet[12];
    
    /// MBAP HEADER
    ////////////////////
    
    // Setting up tranzaction ID - two bytes
    modbus_packet[0] = 0x00;
    modbus_packet[1] = 0x01;
    
    // Setting up protocol ID - two bytes
    modbus_packet[2] = 0x00;
    modbus_packet[3] = 0x00;
    
    // Modbus length - two bytes
    modbus_packet[4] = 0x00;
    modbus_packet[5] = 0x06;
    
    // Setting up Unit ID
    modbus_packet[6] = 0x01;
    
    /// Setting up PDU
    ////////////////////
    
    // Modbus function code
    modbus_packet[7] = 0x01;
    
    // Modbus data start
    modbus_packet[8] = 0x00;
    modbus_packet[9] = 0x01;
    
    //Modbus data count
    modbus_packet[10] = 0x00;
    modbus_packet[11] = 0x0F;

    // Display packet you just created
    printf("-------------\nRequest RAW: ");
    for(int i = 0; i < 12; i++)
        printf("%02hhX ", modbus_packet[i]);
    printf("\n\n");
    
    // Some more debugging info to print
    printf("Transaction ID: %02hhX %02hhX\n", modbus_packet[0], modbus_packet[1]);
    printf("Protocol ID   : %02hhX %02hhX\n", modbus_packet[2], modbus_packet[3]);
    printf("Length        : %02hhX %02hhX\n", modbus_packet[4], modbus_packet[5]);
    printf("Unit ID       : %02hhX\n\n", modbus_packet[6]);
    printf("Function code : %02hhX\n", modbus_packet[7]);
    printf("Start address : %02hhX %02hhX\n", modbus_packet[8], modbus_packet[9]);
    printf("Data count    : %02hhX %02hhX\n\n", modbus_packet[10], modbus_packet[11]);
    
    // Write modbus packet
    ssize_t n = write(hSocket, modbus_packet, sizeof(modbus_packet));
    //write(hSocket, "\n", 1);
    if(n < 11)
    {
        fprintf(stderr, "Error while write......");
        exit(1);
    }
    
    // Read server response
    char buffer[128];       // 128 is enough since maximum 80 registers can be read via one request
    
    memset(buffer, 0, sizeof(buffer));
    n = read(hSocket, buffer, 128);
    if(n < 0)
    {
        fprintf(stderr, "Error while read......");
        exit(1);
    }
    
    // Keep in mind when try to decode:
    // coils: 0 - 99999
    // registers: 400001 - 499999
    
    // Print raw response
    printf("-------------\nResponse RAW: ");
    for(int i=0; i < n; i++)
        printf("%02hhX ", buffer[i]);
    printf("\n");
    
    if(buffer[7] != modbus_packet[7])
    {
        printf("Exception returned: %02hhX\n", buffer[8]);
        close(hSocket);
        exit(1);
    }
    
    // Display received data for debugging
    printf("%s\n", buffer);
    printf("Transaction ID: %02hhX %02hhX\n", buffer[0], buffer[1]);
    printf("Protocol ID   : %02hhX %02hhX\n", buffer[2], buffer[3]);
    printf("Length        : %02hhX %02hhX\n", buffer[4], buffer[5]);
    printf("Unit ID       : %02hhX\n", buffer[6]);
    printf("Function code : %02hhX\n", buffer[7]);
    printf("Data count    : %02hhX bytes\n\n", buffer[8]);
    
    close(hSocket);
    return 0;
}