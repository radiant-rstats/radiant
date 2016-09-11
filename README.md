# Radiant - Business analytics using R and Shiny

<!-- [![Build Status](https://travis-ci.org/radiant-rstats/radiant.png?branch=master)](https://travis-ci.org/radiant-rstats/radiant) -->
<!-- [![Coverage Status](https://img.shields.io/coveralls/vnijs/radiant.svg)](https://coveralls.io/r/vnijs/radiant?branch=master) -->


Radiant is an open-source platform-independent browser-based interface for business analytics in [R](http://www.r-project.org/). The application is based on the [Shiny](http://www.rstudio.com/shiny/) package and can be run locally or on a server. Radiant was developed by <a href="http://rady.ucsd.edu/faculty/directory/nijs/" target="\_blank">Vincent Nijs</a>. Please use the issue tracker on GitHub to suggest enhancements or report problems: https://github.com/radiant-rstats/radiant/issues. For other questions and comments please use radiant@rady.ucsd.edu.

## Key features

- Explore: Quickly and easily summarize, visualize, and analyze your data
- Cross-platform: It runs in a browser on Windows, Mac, and Linux
- Reproducible: Recreate results and share work with others as a state-file or an [Rmarkdown](http://rmarkdown.rstudio.com/) report
- Programming: Integrate Radiant's analysis functions with your own R-code
- Context: Data and examples focus on business applications

<iframe width="640" height="375" src="https://www.youtube.com/embed/7L3hDpLw53I" frameborder="0" allowfullscreen></iframe>

#### Explore

Radiant is interactive. Results update immediately when inputs are changed (i.e., no separate dialog boxes) and/or when a button is pressed (e.g., `Estimate` in _Model > Estimate > Logistic regression (GLM)_). This facilitates rapid exploration and understanding of the data.

#### Cross-platform

Radiant works on Windows, Mac, or Linux. It can run without an Internet connection and no data will leave your computer. You can also run the app as a web application on a server.

> **Note:** For Windows users with data that contain multibyte characters please make sure your data are in ANSI format so R(adiant) can load characters correctly.

#### Reproducible

To conduct high-quality analysis, simply saving output is not enough. You need the ability to reproduce results for the same data and/or when new data become available. Moreover, others may want to review your analysis and results. Save and load the state of the application to continue your work at a later time or on another computer. Share state-files with others and create reproducible reports using [Rmarkdown](http://rmarkdown.rstudio.com/). See also the section on `Saving and loading state` below

If you are using Radiant on a server you can even share the url (include the SSUID) with others so they can see what you are working on. Thanks for this feature go to [Joe Cheng](https://github.com/jcheng5).

#### Programming

Although Radiant's web-interface can handle quite a few data and analysis tasks, you may prefer to write your own R-code. Radiant provides a bridge to programming in R(studio) by exporting the functions used for analysis (i.e., you can conduct your analysis using the Radiant web-interface or by calling Radiant's functions directly from R-code). For more information about programming with Radiant see the [programming](http://radiant-rstats.github.io/docs/programming.html) page on the documentation site.

#### Context

Radiant focuses on business data and decisions. It offers tools, examples, and documentation relevant for that context, effectively reducing the business analytics learning curve.

## How to install Radiant

- Required: [R](https://cran.r-project.org/) version 3.3.0 or later
- Required: A modern browser (e.g., [Chrome](https://www.google.com/intl/en/chrome/browser/desktop/) or Safari). Internet Explorer (version 11 or higher) should work as well
- Required: [Rstudio](http://www.rstudio.com/products/rstudio/download/)

If you use Rstudio (version 0.99.893 or later) you can start and update Radiant through the `Addins` menu at the top of the screen. To install the latest version of Radiant for Windows or Mac, with complete documentation for off-line access, open R(studio) and copy-and-paste the command below:

```r
install.packages("radiant", repos = "https://radiant-rstats.github.io/minicran/", type = 'binary')
```

Once all packages are installed select `Radiant` from the `Addins` menu in Rstudio or use the command below to launch the app:

```r
radiant::radiant()
```

See the [installing radiant](http://radiant-rstats.github.io/docs/install.html) page for details.

**Optional:** You can also create a launcher on your Desktop to start Radiant by typing `radiant::launcher()` in the R(studio) console and pressing return. A file called `radiant.bat` (windows) or `radiant.command` (mac) will be created that you can double-click to start Radiant in your default browser. The `launcher` command will also create a file called `update_radiant.bat` (windows) or `update_radiant.command` (mac) that you can double-click to update Radiant to the latest release.

When Radiant starts you will see data on diamond prices. To close the application click the <i title='Power off' class='fa fa-power-off'></i> icon in the navigation bar and then click `Stop`. The Radiant process will stop and the browser window will close (Chrome) or gray-out.

## Documentation

Documentation and tutorials are available at <http://radiant-rstats.github.io/docs/> and in the Radiant web interface (the <i title='Help' class='fa fa-question'></i> icons on each page and the <i title='Help' class='fa fa-question-circle'></i> icon in the navigation bar).

Want some help getting started? Watch the tutorials on the [documentation site](http://radiant-rstats.github.io/docs/tutorials.html).

## Reporting issues

Please use the GitHub issue tracker at <a href="https://github.com/radiant-rstats/radiant/issues" target="_blank">github.com/radiant-rstats/radiant/issues</a> if you have any problems using Radiant.

<!--
## Online

Not ready to install Radiant on your computer? Try it online at the links below:

<a href="https://vnijs.shinyapps.io/analytics" target="_blank">vnijs.shinyapps.io/analytics</a>

<a href="https://vnijs.shinyapps.io/marketing" target="_blank">vnijs.shinyapps.io/marketing</a>

<a href="https://vnijs.shinyapps.io/quant" target="_blank">vnijs.shinyapps.io/quant</a>

<a href="https://vnijs.shinyapps.io/base" target="_blank">vnijs.shinyapps.io/base</a>

Please **do not** upload sensitive data to these public servers. Note that data upload for the example applications is has been restricted 5MB for security reseasons.

## Running Radiant on shinyapps.io / shiny-server

You can run Radiant on shinyapps.io or a (linux) server supported by Shiny server.

To run your own server instance copy/fork the repo from github and [deploy to shinyapps.io as usual](http://shiny.rstudio.com/articles/shinyapps.html). Shinyapps.io may complain about paths but you shouldn’t have any trouble if you know how to deploy to shinyapps.io. If you do run into difficulties, also clone the repo at <a href="https://github.com/vnijs/shinyapps" target="_blank">https://github.com/vnijs/shinyapps</a> and run the deploy2shinyapp.R file in the Radiant/build folder.
-->

## Running Radiant on shiny-server

You can also host Radiant using [shiny-server](http://www.rstudio.com/products/rstudio/download-server/). First, install radiant on the server using the command below:

```r
install.packages("radiant", repos = "https://radiant-rstats.github.io/minicran/")
```

Then clone the <a href="https://github.com/radiant-rstats/radiant" target="_blank">radiant</a> repo and point shiny-server to the `inst/app/` directory. As a courtesy, please let me know if you intend to use Radiant on a server.

## Saving and loading state

To save your analyses save the state of the app to a file by clicking on the <i title='Save' class='fa fa-save'></i> icon in the navbar and then on `Save state` (see also the `Data > Manage` tab). You can open this state-file at a later time or on another computer to continue where you left off. You can also share the file with others that may want to replicate your analyses. As an example, load the state-file [`radiant-state.rda`](https://radiant-rstats.github.io/docs/examples/radiant-state.rda) through the _Data > Manage_ tab. Go to _Data > View_ and _Data > Visualize_ to see some of the settings. There is also a report in _R > Report_ that was created using the Radiant interface. The html file <a href="https://radiant-rstats.github.io/docs/examples/radiant-state.html" target="_blank">`radiant-state.html`</a> contains the output.

A related feature in Radiant is that state is maintained if you accidentally navigate to another page, close (and reopen) the browser, and/or hit refresh. Use `Refresh` in the <i title='Power off' class='fa fa-power-off'></i> menu in the navigation bar to return to a clean/new state.

Loading and saving state also works with Rstudio. If you start Radiant from Rstudio and use <i title='Power off' class='fa fa-power-off'></i> > `Stop` to stop the app, lists called `r_data` and `r_state` will be put into Rstudio's global workspace. If you start radiant again using `radiant()` it will use these lists to restore state. This can be convenient if you want to make changes to a data file in Rstudio and load it back into Radiant. Also, if you load a state-file directly into Rstudio it will be used when you start Radiant to recreate a previous state.

**Technical note**: Loading state works as follows in Radiant: When an input is initialized in a Shiny app you set a default value in the call to, for example, numericInput. In Radiant, when a state-file has been loaded and an input is initialized it looks to see if there is a value for an input of that name in a list called `r_state`. If there is, this value is used. The `r_state` list is created when saving state using `reactiveValuesToList(input)`. An example of a call to `numericInput` is given below where the `state_init` function from `radiant.R` is used to check if a value from `r_state` can be used.

```r
numericInput("sm_comp_value", "Comparison value:", state_init('sm_comp_value', 0))
```

## Source code

The source code is available on GitHub at <https://github.com/radiant-rstats>. `radiant.data`, offers data loading, saving, viewing, visualizing, combining, and transforming tools. `radiant.design` builds on `radiant.data` and adds tools for experimental design, sampling, and sample size calculation. `radiant.basics` covers the basics of statistical analysis (e.g., comparing means and proportions, cross-tabs, correlation, etc.) and includes a probability calculator. `radiant.model` covers model estimation (e.g., logistic regression and neural networks), model evaluation (e.g., gains chart, profit curve, confusion matrix, etc.), and decision tools (e.g., decision analysis and simulation). Finally, `radiant.multivariate` includes tools to generate brand maps and conduct cluster, factor, and conjoint analysis.

These tools are used in the _Business Analytics_, _Quantitative Analysis_, _Research for Marketing Decisions_, _Consumer behavior_, _Experiments in firms_, and _Customer Analytics_ classes at the Rady School of Management (UCSD).

## Credits

Radiant would not be possible without [R](https://cran.r-project.org/) and [Shiny](http://shiny.rstudio.com/). I would like to thank [Joe Cheng](https://github.com/jcheng5), [Winston Chang](https://github.com/wch), and [Yihui Xie](https://github.com/yihui) for answering questions, providing suggestions, and creating amazing tools for the R community. Other key components used in Radiant are ggplot2, dplyr, tidyr, magrittr, broom, shinyAce, rmardown, and DT. For an overview of other packages that Radiant relies on please see the <a href="http://radiant-rstats.github.io/docs/about.html" target="_blank">about</a> page.


## License


Radiant is licensed under the <a href="http://www.tldrlegal.com/l/AGPL3" target="\_blank">AGPLv3</a>. The documentation and videos on this site as well as the Radiant help files are licensed under the creative commons attribution, non-commercial, share-alike license <a href="http://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC-NC-SA</a>.

As a summary, the AGPLv3 license requires, attribution, including copyright and license information in copies of the software, stating changes if the code is modified, and disclosure of all source code. Details are in the COPYING file.

If you are interested in using Radiant please email me at radiant@rady.ucsd.edu

&copy; Vincent Nijs (2016) <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank"><img alt="Creative Commons License" style="border-width:0" src="https://radiant-rstats.github.io/docs/images/80x15.png" /></a>
