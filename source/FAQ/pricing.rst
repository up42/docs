.. meta::
   :description: UP42 Frequently asked questions about pricing
   :keywords: faq, pricing, support

=============
 Pricing FAQ
=============

.. _credit:

What is an UP42 credit?
=======================

An UP42 credit is a token of value that abstracts pricing complexity
across all data and processing blocks. It allows a simple way to pay for
usage of data and processing blocks as well as infrastructure while each
having different pricing mechanisms. A **credit** equals **0,01 EUR** (1 cent).

How do I buy UP42 credits?
==========================

Credits come in prepaid bundles. Just go
to `settings/credits/purchase <https://console.up42.com/settings/credit/purchase>`__,
select the plan with the number of credits you want and enter your
credit card information. If you want to buy credits in larger bundles,
please contact our `sales team <mailto:sales@up42.com>`__. To browse the
currently available credit packages go to our `pricing
page <https://up42.com/pricing>`__.

How are credits used on UP42?
=============================

Every time you run a job for a workflow credits are consumed in:

1. **Data** how much data you consumed from the chosen data block.
2. **Processing** how much work was done by the processing blocks in
   your workflow.
3. **Infrastructure** costs: how much machine time you used on UP42’s
   infrastructure.

In the job page you can see the breakdown of the credit usage in a
table where each row is a step on the workflow. Above the table
shows the applicable credit usage per type of task: **Data**,
**Processing**, and **Infrastructure**.

Do UP42 credits have an expiration date?
========================================

Yes. Credits expire **12 months** after they have been allocated. As
an example, let us consider the case where you created an account and
added a payment method today, and you received your free 100 EUR
equivalent in UP42 credits (10000). If your account was created today,
this means that you have 12 months, starting from today, to use those
credits. Otherwise, they will expire after these 12 months.

Why are there different prices/credit values for blocks?
========================================================

Blocks are priced differently because they deliver different value. Some
blocks deliver high-resolution commercial data or specially trained
machine learning algorithms. Other blocks provide access to open data or
open source image processing algorithms. UP42 allows variation on
pricing on a block level so that we can support both commercial and open
data and algorithms. The price is always set by our block providers, not
by UP42. In addition to setting the price, the block providers also
specify how the usage of their block should be counted (e.g., in MB,
square kilometers, scenes, megapixels processed, etc).

Where can I find information on individual block pricing and license terms?
===========================================================================

In the details page of each block you can find details on the definition
of the counting unit for that block and the number of credits per unit,
as well as a link to the **E**\ nd **U**\ ser **L**\ icense **A**\ greement
(EULA) you need to accept before using the data or processing block.

Can I estimate upfront how many credits my job will consume?
============================================================

We are still working on a job estimation engine. In the meantime, you
can get an idea of the overall credit usage for a particular job by:

1. Looking at the details of each block in your workflow.
2. Run test jobs with small **A**\ reas **O**\ f **I**\ nterest (AOIs)
   to get an idea on credit usage before running a job with a larger
   AOI.

Is the data sources I can access dependent on the credit package I acquire?
===========================================================================

No. The different credit packages are based purely on volume of credits.
Note that certain data blocks, due to the sensitivity of the provided
data, require you to go through a compliance check before you are
allowed to use them. This is independent of the credit package you
acquire.

Can I get a refund for credits I no longer need?
================================================

No, credits are not refundable. If you don’t know how many you need,
it’s better to start with smaller packages of credits and only upgrade
to larger credit packages once you have an idea of how many credits you
need for your use case.

My job stopped in the middle of the process. Will I still be charged for credits on it?
=======================================================================================

You will be charged for any tasks that have successfully completed. You
will not get charged for any dry run jobs. To be clear, this means
specifically running a job using the **Test Data Query** functionality
of UP42.

How do I choose the right package?
==================================

We recommend starting with a package that will last you approximately 1
month. Start with smaller credit packs and upgrade once you get more
insights into how many credits your workflows and jobs consume on UP42.

What happens if I run out of credits?
=====================================

You will not be able to start any new jobs if you have less than
**1000** credits.


What type of machine instances are available and what are the costs?
====================================================================

.. table:: UP42 Machine types
   :align: center

   +----------------------+------+----------+-------------------+
   | Machine type         | CPUs | Memory   | Credits [per hour]|
   +======================+======+==========+===================+
   | small                | 0.5  | 2GB      | 37                |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | medium               | 1    | 5GB      | 74                |
   |                      |      |          |                   |
   |                      |      |          |                   |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | large                | 2    | 10GB     | 148               |
   |                      |      |          |                   |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | xlarge               | 4    | 20GB     | 296               |
   |                      |      |          |                   |
   |                      |      |          |                   |
   |                      |      |          |                   |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | gpu_nvidia_tesla_k80 | 4    | 20GB     | 772               |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+


**Notes**

+ All CPUs and GPUs are charged a **minimum** of 1 minute. For example, if
  you run your machine instance for 30 seconds or less, you will be
  billed for 1 minute of usage.
+ After 1 minute, instances are charged in 1 second increments.
+ Credit accounting is **rounded up**: any fractional credit usage
  gets rounded up to 1 credit, e.g., **0.1** credit is billed as **1**
  credit.

.. _machine-typical-loads:

What are examples of typical loads for each machine type?
=========================================================

.. |br| raw:: html

   <br/>

.. table:: Example loads for each machine type
   :align: left

   +----------------------+-------------------------------------------------------------------------------------------------------------------+
   | Machine type         | Example load                                                                            nnn                       |
   +======================+===================================================================================================================+
   | small                | Data block that simply downloads some images, or a very basic processing block.                                   |
   +----------------------+-------------------------------------------------------------------------------------------------------------------+
   | medium               |  Some basic processing tasks, e.g.,  :ref:`K-means clustering <kmeans-clustering-block>`                          |
   |                      |  UP42 demo block.                                                                                                 |
   +----------------------+-------------------------------------------------------------------------------------------------------------------+
   | large                |  Multi-band imagery analysis not parallelizable by raster tiling.                                                 |
   +----------------------+-------------------------------------------------------------------------------------------------------------------+
   | xlarge               | `SNAP toolbox <http://step.esa.int/main/toolboxes/snap/>`__ with more advanced tasks, e.g., using Range           |
   |                      | Doppler Terrain Correction |br| based on the `Aster GDEM <https://asterweb.jpl.nasa.gov/gdem.asp>`__.             |
   +----------------------+-------------------------------------------------------------------------------------------------------------------+
   | gpu_nvidia_tesla_k80 |  GPU intensive ML algorithm, e.g., `Sentinel 2 Super-resolution <https://github.com/up42/s2-superresolution>`__   |
   |                      |  by UP42. |br|                                                                                                    |
   |                      |  Includes xlarge machine with `NVIDIA Tesla K80 GPU <https://www.nvidia.com/en-gb/data-center/tesla-k80>`__       |
   |                      |  and extra 12 GB of `GDDR5 SDRAM <https://en.wikipedia.org/wiki/GDDR5_SDRAM>`__.                                  |
   +----------------------+-------------------------------------------------------------------------------------------------------------------+

What is VAT?
------------

VAT is the `Value Added Tax <https://en.wikipedia.org/wiki/Value-added_tax>`__.
UP42 GmbH is a company operating in the `European Union <https://en.wikipedia.org/wiki/European_Union>`__
(EU) therefore is obliged to charge VAT for every monetary transaction taking place in
our platform: selling credits to customers. The application of VAT is dependent on the
legal status of a customer: **company** or **private** person.


My company operates inside the EU: do I have to pay VAT?
========================================================

If your company operates inside the EU just provide your
`VAT identification number <https://en.wikipedia.org/wiki/VAT_identification_number#European_Union_VAT_identification_numbers>`__, while
filling up the billing address in the console and adding a credit/debit card to your account, and you won't be charged any VAT.


I am located outside the EU: do I still have to pay VAT?
========================================================

No. Customers located outside the EU do not pay VAT.


I am a private customer located in Germany: do I pay VAT?
=========================================================

Yes. You will pay the `current <https://ec.europa.eu/taxation_customs/sites/taxation/files/resources/documents/taxation/vat/how_vat_works/rates/vat_rates_en.pdf>`__ tax rate of 19%.


.. note::

   Due to the extraordinary situation created by `CoVID 19 <https://en.wikipedia.org/wiki/Coronavirus_disease_2019>`_ the
   German government has decided to temporarily lower the maximum VAT
   rate to `16% <https://www.bundesfinanzministerium.de/Content/EN/Standardartikel/Topics/Public-Finances/Articles/2020-06-04-fiscal-package.html>`_ from **July 1st** until the **end of 2020**.

.. raw:: html

   <!--
   Local Variables:
   eval: (auto-fill-mode 0)
   eval: (visual-line-mode 1)
   End:
   -->
