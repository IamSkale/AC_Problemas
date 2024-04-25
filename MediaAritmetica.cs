static void MediaAritmetica(int[] ar)
{
    int n = ar.Length;
    int result = 0;
    for (int i = 0; i < n; i++)
    {
        result += ar[i];
    }
    result = result/n;
    System.Console.WriteLine(result);
}