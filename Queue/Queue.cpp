#include<iostream>
using namespace std;
class Node
{
public:
    int data ;
    Node *next;
};
class Queue
{
private:
    Node *fr,*rear;
public :
    Queue()
    {
        fr=nullptr;
        rear=nullptr;
    }
    void AddNode(int value)
    {
        Node *ptr = new Node();
        ptr->data = value;
        ptr->next = nullptr;

        if (ptr == nullptr)
        {
            cout << "Memory allocation failed!" << endl;
            return;
        }

        if (fr == nullptr)
        {
            fr = rear = ptr;
        }
        else
        {
            rear->next = ptr;
            rear = ptr;
        }

        cout << value << " added to the queue successfully.\n";
    }
    void display()
    {
        if (Empty())
        {
            cout << "\nQueue is empty.\n";
            return;
        }
        cout << "\nElements in Queue: ";
        Node *ptr = fr;
        while (ptr != nullptr)
        {
            cout << ptr->data << " -> ";
            ptr = ptr->next;
        }
        cout << "NULL\n";
    }
    void Dequeue()
    {
        if (Empty())
        {
            cout << "Queue is empty, nothing to delete.\n";
            return;
        }
        Node *temp = fr;
        cout << fr->data << " removed from the queue.\n";
        fr = fr->next;
        delete temp;
        if (fr == nullptr)
            rear = nullptr;
    }


    bool Empty()
    {
        return fr==nullptr;
    }
};
int main ()
{
    Queue q ;
    int key;
    do
    {
        cout<<"\n Add inside the queue"<<endl;
        cout<<"\n display "<<endl;
        cout<<"\nDequeue"<<endl;
        cout<<"Enter the key  from 1-4"<<endl;
        cin>>key;
        if(key==1)
        {
            int value ;
            cout<<"Enter the value "<<endl;
            cin>>value;
            q.AddNode(value);
        }
        else if(key==2)
        {
            q.display();
        }
        else if(key==3)
        {
            q.Dequeue();
        }
    }
    while(key!=4);
}

