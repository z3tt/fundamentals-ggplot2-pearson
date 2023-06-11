<h1 style="font-weight:normal" align="center">
  &nbsp;"Hands–On Data Visualization with {ggplot2}: Concepts"<br>Material for the Pearson Live Training Session for O’Reilly&nbsp;
</h1>

<div align="center">

&nbsp;&nbsp;&nbsp;
<a href="https://www.cedricscherer.com"><img border="0" alt="Blog" src="https://assets.dryicons.com/uploads/icon/svg/4926/home.svg" width="35" height="35"></a>&nbsp;&nbsp;&nbsp;
<a href="mailto:hello@cedricscherer.com"><img border="0" alt="Email" src="https://assets.dryicons.com/uploads/icon/svg/8009/02dc3a5c-6504-4347-85fb-3f510cfecc45.svg" width="35" height="35"></a>&nbsp;&nbsp;&nbsp;
<a href="https://twitter.com/CedScherer"><img border="0" alt="Twitter" src="https://assets.dryicons.com/uploads/icon/svg/8385/c23f7ffc-ca8d-4246-8978-ce9f6d5bcc99.svg" width="35" height="35"></a>&nbsp;&nbsp;&nbsp; 
<a href="https://www.instagram.com/cedscherer/"><img border="0" alt="Instagram" src="https://assets.dryicons.com/uploads/icon/svg/8330/62263227-bb78-4b42-a9a9-e222e0cc7b97.svg" width="35" height="35"></a>&nbsp;&nbsp;&nbsp;
<a href="https://www.linkedin.com/in/cedricpscherer/"><img border="0" alt="LinkedIn" src="https://assets.dryicons.com/uploads/icon/svg/8337/a347cd89-1662-4421-be90-58e5e8004eae.svg" width="35" height="35"></a>&nbsp;&nbsp;&nbsp;
<a href="https://www.behance.net/cedscherer"><img border="0" alt="Behance" src="https://assets.dryicons.com/uploads/icon/svg/8264/04073ce3-5b98-4f32-88d3-82b2ef828066.svg" width="35" height="35"></a>&nbsp;&nbsp;&nbsp;
<a href="https://www.buymeacoffee.com/z3tt"><img border="0" alt="BuyMeACoffee" src="https://www.buymeacoffee.com/assets/img/guidelines/logo-mark-3.svg" width="35" height="35"></a>&nbsp;&nbsp;&nbsp;

</div>
<br>


This is the first training of a two-part workshop series "Create Data Visualizations in R Using the Grammar of Graphics” in collaboration with Pearson and O'Reilly.

* Part 1: **["Hands–On Data Visualization with {ggplot2}: Concepts"](https://www.oreilly.com/live-events/hands-on-data-visualization-with-ggplot2-concepts/0636920089879/)** (this course)
* Part 2: **["Hands-On Guide to Advanced Data Visualization with ggplot2: Custom Design"](https://www.oreilly.com/live-events/hands-on-guide-to-advanced-data-visualization-with-ggplot2-custom-design/0636920092434/)**

<br>

## Course Set-up

### Materials

To get a copy of all the material, **clone this repository** to a directory of your choice or **download and unpack [this zip folder](https://github.com/z3tt/fundamentals-ggplot2-pearson/archive/refs/heads/main.zip)**. 
  
### Software

To run any of the materials locally on your own machine, you will need to install the following:

- A recent version of **R** (download from [here](https://cloud.r-project.org/)) 
- A recent version of **RStudio** (download from [here](https://rstudio.com/products/rstudio/download/#download))
- A suite of **R packages**:
  + ggplot2
  + readr
  + dplyr
  + forcats
  + stringr
  + ragg
  + scales
  + gapminder

You can install all required R packages at once by running the following code in the R command line:

```{r install, eval=FALSE, echo=TRUE}
pkgs <- c("ggplot2", "dplyr", "readr","forcats", "stringr", "scales", "ragg", "gapminder")
unavailable <- setdiff(pkgs, rownames(installed.packages()))
install.packages(unavailable)
```

To run the code, open up Rstudio. Copy–paste the code in the **console pane** (by default in the lower left) and hit enter. Several messages should pop up. Scan these messages that are returned for errors and troubleshoot them if necessary. Warnings and other informational messages can be ignored.

### Fonts

We are using a non-default font in this session. If you want to run all code "as it is", please install the **[Asap Condesed](https://fonts.google.com/specimen/Asap+Condensed) typeface** which is available for free. You find the files in the ./fonts folder. Install them by double-clicking.

If you don't want to or can't install the fonts, it is still possible to run the code. Just make sure to replace the font families in the code with one that is installed on your system--or remove the respective rows (more information during the session).

### For Mac Users

If you want to save your visualization to PDF, please make sure that [XQuartz](https://www.xquartz.org/) is installed which is needed to use the cairo pdf device.

<br>

## Run the Codes 

**Double-click on the `fundamentals-ggplot2-pearson.Rproj` file** which opens up Rstudio with the working directory set to the same folder (i.e. the directory where the Rproj file is placed). 

Now, you can open any script from the files pane (by default in the lower right). To follow the training, **open `fundamentals-ggplot2-pearson.R`**.
