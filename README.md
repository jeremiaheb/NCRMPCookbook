# NCRMPCookbook
NCRMP Cookbook template

https://kenzieknox.github.io/NCRMPCookbook/

--> read as source blob or through RStudio to see all comments here

- All links need to be kept relative for ease of transfer of site
ex: 
    <a href="b-tseries.html">Time series</a>
  rather than
    <a href="https://kenzieknox.github.io/NCRMPCookbook/b-tseries.html">Time series</a>
    
ex: specific loc on page
    <a href="f-tseries.html#Domain_density_by_year">Time series</a>
  rather than
    <a href="https://kenzieknox.github.io/NCRMPCookbook/f-tseries.html#Domain_density_by_year">Time series</a>


- Site theme can be changed/overridden through **style.css**


- Pages can be added to the nav bar or nav bar dropdowns through the **_site.yml** doc


- DO NOT edit any files in the docs folder -- they will be overridden when the site is rebuilt after changes are made


- There are templates sprinkled throughout the pages to aid in keeping the organization and look of the site


WHEN MAKING SITE CHANGES:
- Make a pull from GitHub through RStudio to make sure any changes are up to date on your machine
- Make the change in the project through RStudio
- Build the site under the "Build" tab on RStudio
- Commit the changes to GitHub (**git add -A** in the terminal is easiest, then hit commit under the Git tab on RStudio)
- Push the changes to GitHub though RStudio

WHEN UPDATING CAROUSEL:
- images must be uploaded to corresponding folder in home-figs
- corresponding relative links must be listed in csv file
- double check **all links** open to the correct location based on the image, the order is not always intuitive
- images must be **JPG**
