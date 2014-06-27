* ~~Finish import function for districts with district validation~~
* ~~Generate Devise User with Role~~
* ~~Add CanCan for authorizations~~
* ~~Fix Excel Import~~
* ~~Add complete method to check if all fields all filled on import~~
* Add Ransack gem for filtering
* Add Excel Export
* Add Geocoder functionality with mass batch geocoding

#####Considerations
* First word downcase matcher may make it difficult to add different schools with same first word 
* Importing of Contacts must include School
* Which validation fields are needed?
* ~~Contact Import will update based on ID unless better idea like join(fname,lname) or email~~