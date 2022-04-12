from django.db import models

class Customer(models.Model):
    phone_no = models.CharField(max_length=32, db_index=True,blank=True,null=True)
    name = models.CharField(max_length=128, default="")