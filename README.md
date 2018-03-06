# vToolBox
Toolbox for experimental verification of numerical methods for rigid body simulation or related types of simulation.

This is a collection of various matlab scripts used for creating convergence plots, writing tables of measurements or making histograms and much more.

This toolbox of scripts is provided as is. No real documentation is provided. The idea is to run the run_me.m file to get an idea of the kind of plots and tables these tools can automatically create for you. One simply copies these scripts and tweak and hack them into ones own data formats or needs.

Looking into the file run_me.m will show many examples of how to use the toolbox of scripts and also how to easily organize test data such that it is possible to re-run ones data-processing easily.

The latex table output functionalities can be improved to dump the output into respective latex files that could make inclusion into a latex manuscript more easy by simply using the input command in latex. I usually just copy my stuff from the matlab prompt into my paper writtings.

Enjoy your post-processing time

Kenny

## Organizing Test Data

A word on how to oranize test data. When I run my simulations on a cluster I usually dump profiling information into server side folders named with appropriate names and timestamps. Once all simulations are done I copy my data into the data-folder of this toolbox and add plotting/table printing to the run_me.m script as I need. Keeping data in separate time-stamped folders is highly recommended as one often would want to compare results over time. Makes re-running and re-testing more convenient.

Notice that besides the clean_up_data script (that essentially pack data into the proper structures with proper field names, see Excel sheet for current convesions) there is also an average_results script that are extremely helpfull for creating averages of clean-up measurements.  

