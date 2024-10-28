#include <stdio.h>

__global__ void hello()
{

  printf("Hello from block: %u, thread: %u\n", blockIdx.x, threadIdx.x);
}

int main()
{
  printf("GoGo\n");
  hello<<<10, 10>>>();
  // cudaDeviceSynchronize();
  cudaError_t cudaerr = cudaDeviceSynchronize();
  printf("Done");

  if (cudaerr != cudaSuccess)
  {
    printf("kernel launch failed with error \"%s\".\n",
           cudaGetErrorString(cudaerr));
  }
}
