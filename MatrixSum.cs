static void MatrixSum(int[] a, int[] b, int n, int m)
{
    int k = n * m;
    for (int i = 0; i < k; i++)
    {
        b[i] += a[i];
    }
    int j = 0;
    int i = 0;
    while(true)
    {
        System.Console.WriteLine(b[i]);
        j++;
        i++;
        if(j == n)
        {
            j = 0;
            m--;
            if(m == 0)
            {
                break;
            }
        }
    }
}