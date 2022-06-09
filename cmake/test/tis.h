#ifndef _TIS_H_
#define _TIS_H_

#include <stdio.h>
#include <stdint.h>

int tis_init(void);
int tis_open(void);
int tis_close(void);
int tis_sendrecv(const uint8_t *sendbuf, size_t send_size, uint8_t *recvbuf,
                        size_t *recv_len);

#endif
