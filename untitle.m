/* To find the linear convolution of given sequnces */
#include<stdio.h>
#define LENGHT1 6 /*Lenght of i/p samples sequence*/
#define LENGHT2 4 /*Lenght of impulse response Co-efficients */
int x[2*LENGHT1-1]={1,2,3,4,5,6,0,0,0,0,0}; /*Input Signal Samples*/
int h[2*LENGHT1-1]={1,2,3,4,0,0,0,0,0,0,0}; /*Impulse Response Coefficients*/
int y[LENGHT1+LENGHT2-1];
main()
{
int i=0,j;
for(i=0;i<(LENGHT1+LENGHT2-1);i++)
{
y[i]=0;
for(j=0;j<=i;j++)
y[i]+=x[j]*h[i-j];
}
for(i=0;i<(LENGHT1+LENGHT2-1);i++)
printf("%d\n",y[i]);
}



%-----------------------------------------------------------
/* To find the impusle response of the system*/
#include <stdio.h>  
#define Order 2     /*Order of the system*/
#define Len 10         /*Length of the output response*/
float y[Len]={0,0,0},sum;  
main()  
{  
int j,k;  
float a[Order+1]={0.1311, 0.2622, 0.1311};  
/* y coefficient may change in accordance with the difference equation */  

float b[Order+1]={1, -0.7478, 0.2722};
/* x coefficients may change in accordance with the difference equation */  

for(j=0;j<Len;j++)  
{  
sum=0;  
for(k=1;k<=Order;k++)  
{  
if((j-k)>=0)  
sum=sum+(b[k]*y[j-k]);
}
if(j<=Order)
{
y[j]=a[j]-sum;
}
else
{
y[j]=-sum;
}
printf("Respose[%d] = %f\n",j,y[j]);
}
}

%----------------------------------------------------------------------------------
// C program to find dft of a given sequence
#include <math.h>
#include <stdio.h>
// Driver Code

// Function to calculate the DFT
void calculateDFT(int len)
{
	int xn[10];
	float Xr[10];
	float Xi[10];
	int i, k, n, N = 0;

	for (i = 0; i < len; i++)
	{

		printf("Enter the value of x[%d]: ",i);
		scanf("%d", &xn[i]);
	}

	printf("Enter the number of "
		"points in the DFT: ");
	scanf("%d", &N);
	for (k = 0; k < N; k++) {
		Xr[k] = 0;
		Xi[k] = 0;
		for (n = 0; n < len; n++) {
			Xr[k]
				= (Xr[k]
				+ xn[n] * cos(2 * 3.141592 * k * n / N));
			Xi[k]
				= (Xi[k]
				- xn[n] * sin(2 * 3.141592 * k * n / N));
		}

		printf("(%f) + j(%f)\n", Xr[k], Xi[k]);
	}
}

int main()
{
	int len = 0;
	printf("Enter the length of the sequence: ");
	scanf("%d", &len);
	calculateDFT(len);

	return 0;
}

%-------------------------------------------------------------------------------

/* program to implement circular convolution */

#include<stdio.h>

int m,n,x[30],h[30],y[30],i,j, k,x2[30],a[30];

void main()
{
            printf(" enter the length of the first sequence\n");
            scanf("%d",&m);
            printf(" enter the length of the second sequence\n");
            scanf("%d",&n);

            printf(" enter the first sequence\n");
            for(i=0;i<m;i++)
                        scanf("%d",&x[i]);

            printf(" enter the second sequence\n");
            for(j=0;j<n;j++)
                        scanf("%d",&h[j]);

            if(m-n!=0)        /*If length of both sequences are not equal*/
            {
                        if(m>n)                        /* Pad the smaller sequence with zero*/
                        {
                        for(i=n;i<m;i++)
                                    h[i]=0;
                                    n=m;
                        }
                        for(i=m;i<n;i++)
                                    x[i]=0;
                                    m=n;
            }

            y[0]=0;
            a[0]=h[0];

            for(j=1;j<n;j++)            /*folding h(n) to h(-n)*/
                        a[j]=h[n-j];

            /*Circular convolution*/
            for(i=0;i<n;i++)
                        y[0]+=x[i]*a[i];

            for(k=1;k<n;k++)
            {
                        y[k]=0;
                        /*circular shift*/

                        for(j=1;j<n;j++)
                                    x2[j]=a[j-1];
                                    x2[0]=a[n-1];
                        for(i=0;i<n;i++)
                        {
                                    a[i]=x2[i];
                                    y[k]+=x[i]*x2[i];
                        }
            }

            /*displaying the result*/
            printf(" the circular convolution is\n");
            for(i=0;i<n;i++)
                        printf("%d \t",y[i]);
}
%-----------------------------------------------------------------------------------------