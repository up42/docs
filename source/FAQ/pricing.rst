.. meta::
   :description: UP42 Frequently asked questions about pricing
   :keywords: faq, pricing, support

=============
 Pricing FAQ
=============

.. _credit:

What is an UP42 credit?
=======================

An UP42 credit is the unit used to set the price for data and processing blocks, as well as infrastructure services. **One UP42 credit** equals to **0,01 Euro/Dollar** (1 cent) and **100 UP42 credits** equal to **1 Euro/Dollar**.

How do I buy UP42 credits?
==========================

To purchase credits, go to `Credit Management <https://console.up42.com/settings/credit>`_, add a credit card and select the preferred credit package. If you want to buy credits in larger packages, please contact our `sales team <sales@up42.com>`_. For more information about the credit packages, please visit the page `Pricing <https://up42.com/pricing>`_.

How are credits used on UP42?
=============================

Every time you run a job, the following costs are considered:

1. **Data costs**: how much data was consumed through a data block.
2. **Processing costs**: how much data was processed through a processing block.
3. **Infrastructure costs**: costs: how much machine time was used while running a job.

These costs are also displayed in the job dashboard. For more information, please refer to the article `Core concepts <https://docs.up42.com/going-further/core-concepts.html#job-dashboard>`_.

Do UP42 credits have an expiration date?
========================================

Yes. Credits expire **24 months** after they have been allocated. For example, a user created an account on the 1st of January 2020 and received the 10 000 sign-up credits. Starting with the 1st of January 2020, the user has 24 months to use those credits.

Why do blocks have different prices?
====================================

Data and processing blocks are priced differently because they serve different purposes, such as: providing access to high-resolution commercial data, providing access to open data, delivering machine learning algorithms for ship detection, car detection, land cover classification etc. The price is usually set by the upstream data/algorithm providers who distribute their service via UP42 data or processing blocks. These providers also specify the units for block usage (e.g., MB, square kilometers, scenes, megapixels processed, etc).

Where can I find information on block pricing and license terms?
================================================================

The following information can be found in the block descriptions on the `Marketplace <https://marketplace.up42.com/>`_: ``Provider``, ``Provider website``, ``Version``, ``Price`` and a link to the End User License Agreement (EULA) that needs to be accepted before using block.

Can I estimate upfront how many credits my job will consume?
============================================================

Yes. For more information, please refer to `Build the first UP42 workflow <https://docs.up42.com/getting-started/first-workflow.html#price-estimation>`_.

Is the access to the various data sources depending on the credit package I acquired?
=====================================================================================

No. The different credit packages are solely based on the volume of credits. However, please note that certain blocks, due to the sensitivity of their provided information, are restricted and require an additional compliance check of the users.

Can I get a refund for credits I no longer need?
================================================

No, credits are not refundable. If you are not sure about the quantity of credits you need, we recommend first purchasing smaller credit packages and subsequently upgrading to larger credit packages, depending on how many credits are needed for your use case.

My job stopped in the middle of the process. Will I still be charged?
=====================================================================

You will be solely charged for tasks that have successfully completed. You will not be charged for running test queries. For more information about test queries, please refer to `Build the first UP42 workflow <https://docs.up42.com/getting-started/first-workflow.html#configure-job>`_.

How do I choose the right package?
==================================

We recommend starting with a smaller credit package and then upgrading to a larger credit package, after you get more insights into how many credits are needed to run the jobs.

What happens if I run out of credits?
=====================================

If you have a balance of less than **1000 credits**, you will not be able to run any new jobs.

What type of machine instances are available and what are the costs?
====================================================================

.. table:: UP42 Machine types
   :align: center

   +----------------------+------+----------+-------------------+
   | Machine type         | CPUs | Memory   | Credits [per hour]|
   +======================+======+==========+===================+
   | small                | 0.5  | 2GB      | 4                 |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | medium               | 1    | 5GB      | 9                 |
   |                      |      |          |                   |
   |                      |      |          |                   |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | large                | 2    | 10GB     | 19                |
   |                      |      |          |                   |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | xlarge               | 4    | 20GB     | 38                |
   |                      |      |          |                   |
   |                      |      |          |                   |
   |                      |      |          |                   |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | xxlarge              | 8    | 40GB     | 76                |
   |                      |      |          |                   |
   |                      |      |          |                   |
   |                      |      |          |                   |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | xxxlarge             | 16   | 80GB     | 152               |
   |                      |      |          |                   |
   |                      |      |          |                   |
   |                      |      |          |                   |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | gpu_nvidia_tesla_k80 | 4    | 20GB     | 99                |
   |                      |      |          |                   |
   +----------------------+------+----------+-------------------+
   | gpu_p100_xxl         | 8    | 40GB     | 258               |
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
   | small                | Data block that downloads images or a processing block with a very basic algorithm. block.                        |
   +----------------------+-------------------------------------------------------------------------------------------------------------------+
   | medium               |  Processing block with a basic algorithm, e.g.  :ref:`K-means clustering <kmeans-clustering-block>`               |
   |                      |  UP42 demo block.                                                                                                 |
   +----------------------+-------------------------------------------------------------------------------------------------------------------+
   | large                |  Multi-band imagery analysis not parallelizable with raster tiling.                                               |
   +----------------------+-------------------------------------------------------------------------------------------------------------------+
   | xlarge               |  More advanced algorithms, e.g. Range Doppler Terrain Correction.                                                 |
   +----------------------+-------------------------------------------------------------------------------------------------------------------+
   | gpu_nvidia_tesla_k80 |  GPU intensive ML algorithm, e.g., `Sentinel 2 Super-resolution <https://github.com/up42/s2-superresolution>`__   |
   |                      |  by UP42. |br|                                                                                                    |
   |                      |  Includes xlarge machine with `NVIDIA Tesla K80 GPU <https://www.nvidia.com/en-gb/data-center/tesla-k80>`__       |
   |                      |  and extra 12 GB of `GDDR5 SDRAM <https://en.wikipedia.org/wiki/GDDR5_SDRAM>`__.                                  |
   +----------------------+-------------------------------------------------------------------------------------------------------------------+

What is VAT?
============

VAT is the Value Added Tax. UP42 GmbH is a company operating in the European Union (EU), therefore we are obliged to charge VAT for every monetary transaction taking place in our platform, including selling credits to customers. The application of VAT is dependent on the legal status of a customer: **company** or **private person**.

My company operates inside the EU: do I have to pay VAT?
========================================================

Yes. If your company operates inside the EU, a VAT identification number is necessary. Other information required: billing address and a credit/debit card.

My company operates outside the EU: do I have to pay VAT?
=========================================================

No. Customers located outside the EU do not pay VAT.

I am a private customer located in Germany: do I pay VAT?
=========================================================

Yes. You will pay the current tax rate of 19%.

.. note::

   Due to the Due to the COVID-19 situation, the German government decided to temporarily lower the maximum VAT rate to 16% from **1st of July 2020 until the 31st of December 2020**.

.. raw:: html

   <!--
   Local Variables:
   eval: (auto-fill-mode 0)
   eval: (visual-line-mode 1)
   End:
   -->
