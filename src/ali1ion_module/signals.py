from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User

# Example signal handler: Trigger when a new user is created
@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        print(f'User profile created for {instance.username}') 
