#if HAVE_CONFIG_H
#  include <config.h>
#endif /* HAVE_CONFIG_H */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <netdb.h>
#include <malloc.h>
#include <getopt.h>
#include <arpa/inet.h>
#include <time.h>
#include <infiniband/verbs.h>

#include "basic_ib.h"
#include "basic_tcp.h"
#include "basic_rc.h"

int main(int argc, char *argv[]) {
    settings_t settings, *s = &settings;
    ib_context_t ib_ctx, *ctx = &ib_ctx;

    parse_args(argc, argv, s, 0);
    init_ctx(ctx, s);
    init_tcp_recv(ctx);

    while (1) {
        init_rc_recv(ctx);
        recv_loop(ctx, 0, 1);
        free_rc_recv(ctx);
    }
    free_ctx(ctx);
    return 0;
}
