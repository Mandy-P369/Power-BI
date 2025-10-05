#include<stdio.h>
struct Queue
{
    int data ;
    struct Queue *next;
}*front,*rear;
struct Queue *Data()
{
    struct Queue *q;
    q= (struct Queue *)malloc(sizeof(struct Queue));
    printf("\n Enter the data ");
    scanf("%d",&q->data);
    return q;
};
void AddNode()
{
    struct Queue *q;
    q=Data();
    if(q==NULL)
    {
        printf("\nMemory cannot be allocated ");
        return;
    }
    else
    {
        if(front==NULL)
        {
            front=q;
            rear = q;
            q->next = NULL;
        }
        else
        {
            rear->next = q;
            q->next =NULL;
            rear=q;
        }
        printf("\n New Node added at the queue");
    }
}
void Traverse()
{
    struct Queue *p;
    if(front==NULL)
    {
        printf("\n No node exist inside the queue");
        return ;
    }
    else
    {
        for(p=front;(p);p=p->next)
        {
            printf("%d--->",p->data);
        }
    }
}
void Delete()
{
    struct Queue *p;
    if(front==NULL)
    {
        printf("\nNo Data exist inside the queue");
        return ;
    }
    else
    {
        p=front;
        front=front->next;
        free(p);
        printf("\n Node deleted");
    }
}
void showfront()
{
    struct Queue *q;
    q=front;
    printf("\nThe front node of the Queue is : %d\t",q->data);
    return q;

}
void main ()
{
    front=NULL;
    rear =NULL;
    int key ;
    do
    {
        printf("\n1.Add the element :");
        printf("\n2.Traverse the node : ");
        printf("\nEnter the key from 1-3");
        scanf("%d",&key);
        if(key==1)
        {
            AddNode();
        }
        else if (key==2)
        {
            Traverse();
        }
        else if(key==3)
        {
            Delete();
        }
        else if (key==4)
        {
            showfront();
        }
    }
    while(key!=5);
}
