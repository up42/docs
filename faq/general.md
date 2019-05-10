# General FAQ

 Q: How can I get support from UP42 for my projects?
 
 A: 
 
 Q: How do I signup for an account?
 
 Q: Where can I learn more about Docker?
 
 A: Does UP42 provides public images in its docker registry?
 
 Q: Can I write my custom block in programming language X?
 
 Q: Two blocks (e.g. Landsat 8 and Airbus ship detection) can be run together as their capabilities match, but the ship detection then fails. Why is that so?
 
 A: Matching capabilities in a workflow is a necessary requirement to run it and automatically checked
 by the workflow editor. This avoids mismatches such as an algorithm expecting a Sentinel-1 GRD image file
 is started with a RGB image from a multispectral sensor. The capabilities matching though is not (yet)
 able to identify all mismatches between blocks. Please read the block description carefully before trying
 to run a block to understand if the input requirements are met.
