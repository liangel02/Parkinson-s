from django.http import HttpResponse
from django.shortcuts import render
from . import parkinsons

# Create your views here.
def answer(request):
    label = parkinsons.final()
    return HttpResponse(label)

def index(request):
    return render(request, 'index.html')

def search(request):
    print("i am in search")
    if request.method == 'POST':
        print("get")
        search_id = request.POST['username']
        return HttpResponse(search_id)
    else:
        print("render")
        return render(request, 'index.html')

