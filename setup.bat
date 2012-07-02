rails generate scaffold Tag value:string family:references

rails generate scaffold Email value:string person:references

rails generate scaffold PhoneNumber value:string person:references family:references

rails generate scaffold Comments value:string family:references

rails generate scaffold Address name:string street:string city:string state:string zipCode:string date_deleted:string is_deleted:integer family:references

rails generate scaffold Person firstName:string middleName:string lastName:string family:references emails:references phoneNumbers:references tags:references birthday:string date_deleted:string is_deleted:integer

rails generate scaffold Family name:string comments:references families:references addresses:references tags:references anniversary:string phoneNumbers:references date_deleted:string is_deleted:integer