static void ABBAddSub(int[] ar)
{
    int l1 = ar.Length - 1;
    while (true)
    {
        int i = (l1 - 2) / 2;
        if (ar[l1] != -1)
        {
            ar[i] -= ar[l1];
        }
        if (ar[l1 - 1] != -1)
        {
            ar[i] += ar[l1 - 1];
        }
        if (l1 == 2)
        {
            break;
        }
        l1 -= 2;
    }
    System.Console.WriteLine(ar[0]);
}