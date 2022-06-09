#include <timer.h>
#include <unistd.h>
#include <spi-generic.h>
#include <stdio.h>

void timer_monotonic_get(struct mono_time *mt)
{
	printf("timer_monotonic_get\n");
}

void udelay(unsigned int usec)
{
	printf("udelay\n");
	usleep(usec);
}

int spi_claim_bus(const struct spi_slave *slave)
{
	printf("spi_claim_bus\n");
	return 0;
}

void spi_release_bus(const struct spi_slave *slave)
{
	printf("spi_release_bus\n");
}


int spi_setup_slave(unsigned int bus, unsigned int cs, struct spi_slave *slave)
{
	printf("spi_setup_slave\n");
	return 0;
}

int spi_xfer(const struct spi_slave *slave, const void *dout, size_t bytesout,
	     void *din, size_t bytesin)
{
	printf("spi_xfer\n");
	return 0;
}
