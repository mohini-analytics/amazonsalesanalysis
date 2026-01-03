<h1>Amazon Sales Analysis</h1>



<h2>OVERVIEW</h2>

</b>This project focuses on extracting actionable business insights from a large, real-world Amazon UK product dataset using a combination of cloud-based analytics, statistical techniques, and business intelligence tools.

- The dataset (600K+ records) was hosted on Google BigQuery, enabling scalable SQL-based data exploration, cleaning, and transformation. SQL was used extensively to derive key metrics such as product distribution, category trends, pricing patterns, brand performance, and data quality gaps.
- R was used for statistical validation of SQL insights, including correlation analysis and visual exploration of price, ratings, and review volume.
- Power BI was used to design interactive dashboards with slicers and drill-down capabilities, allowing stakeholders to explore performance trends and compare categories, brands, and price segments.
- Google Docs was used to document the analytical approach, SQL logic, visual summaries, and final recommendations, ensuring insights were communicated in a clear, business-facing format.

This end-to-end project demonstrates practical capability in big data querying, statistical analysis, insight generation, and stakeholder-ready reporting.

</b>
<br />


<h2>Languages and Utilities Used</h2>

- <b>SQL</b> 
- <b>R</b>

<h2> Software Used</h2>

- <b>ADVANCED EXCEL</b> 
- <b>POWER BI</b>
- <b>BIGQUERY</b>
- <b>MICROSOFT VISIO</b>

<h2>Environments Used </h2>

- <b>Windows 10</b> 

## Project Artefacts & Documentation

The following artefacts simulate real-world Business Analyst deliverables used to support stakeholder alignment, decision-making, and implementation.

- [**Business Requirements Report (BRD)**](docs/Business_Requirements.md) : 
  Documents the business context, objectives, scope, assumptions, and high-level requirements that guided the analysis.

- [**Executive Summary & Key Findings** ](docs/Executive_Summary.md) : 
  Summarises key insights, risks, and recommendations in a business-facing format suitable for senior stakeholders.

- [**Dashboards & Visual Mockups**](docs/Dashboards_and_Mockups.md) : 
  Interactive Power BI dashboards are designed to answer specific business questions defined through user stories and acceptance criteria.

- [**Recommendations & Next Steps**](docs/Recommendations.md) : 
  Actionable recommendations derived from the analysis, outlining potential quality, pricing, and category-level interventions.



<h2>Business Problem Statement & Use Cases</h2>

<b>PROJECT OBJECTIVE<b>

Provide actionable, data-driven insights to improve product performance, pricing strategy, and category prioritisation for Amazon UK by analysing sales, pricing, reviews, and ratings data. The objective is to enable business stakeholders to identify high-value product categories, understand price sensitivity, and mitigate risks associated with low customer ratings and review volumes, thereby supporting informed commercial and operational decision-making.

<b>Business Context<b>

Amazon UK operates across thousands of product categories with varying price points, customer demand, and quality perception. Business teams such as Category Management, Pricing, and Operations require reliable insights to answer questions like:

- Which categories contribute the most revenue but underperform on customer satisfaction?
- How does product pricing influence customer reviews and ratings?
- Where should improvement, promotion, or quality interventions be prioritised?


Without structured analytics and dashboards, these decisions rely on fragmented reports and intuition rather than evidence. This project simulates a real-world business analysis engagement, where raw product-level data is transformed into insights that support strategic and operational decisions.


<b>Stakeholder / User Role	Responsibility<b>

- Category Managers -	Own category performance, quality, and growth
- Pricing & Commercial Team	- Define pricing strategies and promotions
- Operations / Quality Teams -	Identify quality risks and improvement areas
- Senior Management -	Review performance and prioritise investments


<b> USE CASE 1 — Category Strategy & Performance Prioritisation <b>

Key Users- Category Managers, Senior Commercial Leadership

<b>Business Problem<b>

Amazon UK manages a large number of product categories, but not all categories perform equally in terms of revenue, customer satisfaction, and review volume.

Category managers need to answer:

- Which categories generate high sales but suffer from low customer ratings?
- Which categories have strong ratings but low review volume (potential growth opportunity)?
- Where should quality improvements or vendor interventions be prioritised?

Without this insight, teams risk: 
- Investing in low-impact categories
- Missing early warning signs of declining customer experience


<b>Business Questions<b>

- What are the top product categories by total sales and revenue?
- How do average ratings vary across high-revenue categories?
- Are there categories with high sales but below-average ratings?
- Which categories have low review counts, indicating limited customer feedback or adoption risk?


<b>Expected Insights<b>

- Identification of high-revenue, low-rating categories that require quality improvement
- Detection of high-rating but low-review categories with potential for promotion
- Clear category-level performance comparison to support prioritisation decisions


<b>Business Outcome<b>

- Category managers can prioritise corrective actions (quality checks, supplier reviews)
- Leadership gains visibility into where investment or intervention will deliver the highest ROI
- Data-backed discussions replace intuition-driven decisions

<b>


User Story 1.1 — Category Performance Prioritisation

As a Category Manager, I want to view product categories ranked by total demand and average customer rating, So that I can prioritise categories for quality improvement and supplier intervention.



Acceptance Criteria

- Dashboard displays category-level total demand, average rating, and total review count
- Categories are ranked by total demand (highest to lowest)
- Categories with below-average ratings are clearly highlighted
- Results update dynamically based on applied filters

Implementation Status: COMPLETED
Delivery Artefact: Power BI – Category Performance Dashboard

DASHBOARD EVIDENCE: [Open full-size dashboard screenshot](screenshots/use-case-1/category-performance-dashboard.png)

<b>

<b>
User Story 1.2 — Review Volume Risk Identification

As a Category Manager, I want to identify product categories with low review volume relative to demand, so that I can flag adoption risks and prioritise feedback, promotion, or vendor follow-ups.



Acceptance Criteria

- Dashboard displays category-level total demand and total review count
- Categories with low review volume are clearly highlighted
- Categories are sortable by total demand and review count
- Results update dynamically based on applied filters (e.g. price band)


Implementation Status: Completed  
Delivery Artefact: Power BI – Review Volume Risk Dashboard

(Low review volume categories are highlighted using a DAX-driven colour logic to visually surface adoption risk.)

Insight Note: Based on the defined threshold (overall average review volume), no categories were flagged as low review volume. This indicates generally healthy customer engagement across product categories within the analysed dataset.

DASHBOARD EVIDENCE: [Open full-size dashboard screenshot](screenshots/use-case-1/review-volume-risk-dashboard.png)

<b>



<b>USE CASE 2 — Price Sensitivity & Customer Perception<b>

Key Users- Pricing Team, Commercial Strategy Team


<b>Business Problem<b>

Pricing directly influences customer expectations, purchase behaviour, and satisfaction. However, pricing decisions are often made without clear visibility into how price correlates with ratings and reviews.

The pricing team needs to understand:
- Whether higher-priced products receive better or worse ratings
- If certain price bands consistently underperform in customer reviews
- Where pricing adjustments or promotional strategies may improve customer response


<b>Business Questions<b>

- How does the average rating change across different price ranges?
- Do higher-priced products receive fewer reviews, indicating lower purchase volume?
- Are there price thresholds where customer satisfaction drops significantly?
- Which price bands show the best balance of revenue and customer satisfaction?


<b>Expected Insights<b>

- Identification of price bands associated with lower ratings
- Understanding of the review volume vs. price relationship
- Evidence to support pricing experiments, discounts, or bundling strategies


<b>Business Outcome<b>

- Pricing teams can optimise pricing strategies using data rather than assumptions
- Reduced risk of customer dissatisfaction due to misaligned pricing
- Improved alignment between price, perceived value, and customer experience



<b>
User Story 2.1 — Price Band vs Customer Satisfaction

As a Pricing Analyst, I want to analyse how customer ratings and review volume vary across price bands, so that I can identify price ranges where customer satisfaction drops or improves.


Acceptance Criteria

- Products are grouped into clear price bands
- Average rating is visible per price band
- Total reviews and total demand are visible per price band
- Price bands with lower average ratings are clearly identifiable
- Results update dynamically based on filters


Implementation Status: Completed  
Delivery Artefact: Power BI – Price Sensitivity Dashboard

DASHBOARD EVIDENCE: [Open full-size dashboard screenshot](screenshots/use-case-2/price-sensitivity-dashboard.png)

The analysis shows a clear decline in average customer rating as prices increase, with the high price band exhibiting a significant drop in satisfaction despite comparable demand levels. This suggests a potential value perception gap at higher price points and highlights an opportunity to review pricing, bundling, or positioning strategies.



User Story 2.2 — Price vs Review Volume

As a Pricing Analyst, I want to analyse how customer review volume varies across price bands, so that I can identify price ranges where higher prices may be limiting customer adoption or confidence.

Acceptance Criteria

- Products are grouped into defined price bands
- Total review volume is visible per price band
- Review volume differences across price bands are clearly comparable
- Price bands with significantly lower review engagement are identifiable
- Visual supports comparison alongside pricing decisions


Implementation Status: Completed  
Delivery Artefact: Power BI – Price vs Review Volume Dashboard


DASHBOARD EVIDENCE: [Open full-size dashboard screenshot](screenshots/use-case-2/priceband-review-volume.png)




<b>USE CASE 3 — Review & Rating Risk Identification<b>
Key Users- Operations & Quality Teams

<b>Business Problem<b>
Low review counts and poor ratings can signal quality risks, supplier issues, or unmet customer expectations, but these signals are often detected too late.

Teams need early indicators to:
- Flag products or categories with declining ratings
- Identify products with low engagement (few reviews)
- Prevent reputational and revenue loss



<b>
User Story 3.1 — High-Risk Product Identification

As an Operations or Quality Manager, I want to identify products with low customer ratings and low review volume, so that I can proactively flag quality risks and prioritise corrective actions.


Acceptance Criteria

- Products with low average ratings are identifiable
- Products with low review volume are identifiable
- Products meeting both conditions are clearly flagged as high risk
- Results can be filtered by category and price band
- Visual supports early risk detection



Implementation Status: Completed  
Delivery Artefact: Power BI – High-Risk Product Dashboard

DASHBOARD EVIDENCE: [Open full-size dashboard screenshot](screenshots/use-case-3/product-risk-dashboard.png)



User Story 3.2 — Category-Level Risk Identification

As a Category or Operations Lead, I want to identify product categories with below-average ratings and low engagement, so that I can prioritise quality reviews and supplier interventions at a strategic level.

Implementation Status: Completed  
Delivery Artefact: Power BI – Category Risk Dashboard

DASHBOARD EVIDENCE: [Open full-size dashboard screenshot](screenshots/use-case-3/category-risk-dashboard.png)




## Assumptions & Limitations

### Assumptions

- Products with an average customer rating below 3.5 were considered underperforming, based on common e-commerce benchmarks where ratings below this threshold typically indicate customer dissatisfaction.
- Overall average review volume was used as a benchmark to identify low customer engagement, acknowledging that review behaviour can vary by product category.
- Price bands (Low / Medium / High) were defined using fixed price thresholds to simplify comparative analysis and support pricing decisions.
- Review count and recent purchase indicators were used as proxies for demand and customer engagement due to the absence of direct sales revenue data.

### Limitations

- The dataset does not include actual sales or revenue figures, so demand analysis is based on inferred engagement metrics.
- Customer ratings and reviews are user-generated and may be influenced by individual bias or extreme experiences.
- Category-level analysis may mask performance variation at the individual product level.
- The analysis represents a snapshot in time and does not account for seasonality or long-term trends.



## Key Takeaways

- Category-level analysis highlighted that certain high-demand categories underperform on customer ratings, indicating opportunities for targeted quality improvements and supplier review.
- Pricing analysis revealed a clear decline in customer satisfaction within higher price bands despite comparable demand levels, suggesting a potential value perception gap at higher price points.
- Review volume analysis showed generally healthy customer engagement across categories, with no products meeting combined high-risk thresholds under default business rules.
- Risk dashboards demonstrated stable quality and engagement signals overall, enabling teams to focus on selective interventions rather than broad corrective actions.




<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
