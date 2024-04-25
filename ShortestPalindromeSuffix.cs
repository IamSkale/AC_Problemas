static void ShortestPalindromeSUffix(int[] ar)
{    
    int n = ar.Length;
    for (int i = 0; i < n; i++)
    {
        for (int j = n - 1; j >= i; j--)
        {
            if (ar[j] != ar[n - j + i - 1])
            {
                break;
            }
            if (j == i)
            {
                for (int k = i-1; k >= 0; k--)
                {
                    System.Console.Write(ar[k]);
                }
                return ;
            }
        }
    }
}