# Data-Bit-3-Sophia — The Deaths We Don't Count

> "For every death in the Mediterranean, there are at least two in the Sahara. Unknown and anonymous."
> — Alessandra Morelli, Head of UNHCR Niger

A data-driven editorial piece on migrant mortality in the Mediterranean and the Sahara Desert, built with SvelteKit and D3.js.

🔗 **Live site:** [https://data-journalism-26.github.io/data-bit-3-sophiahiss3/](https://data-journalism-26.github.io/data-bit-3-sophiahiss3/)

# Project Structure

data-bit-3-sophiahiss3/
├── .github/
│   └── workflows/
│       └── deploy.yml                         # GitHub Pages deployment workflow
├── .vscode/
│   └── extensions.json
├── src/
│   ├── lib/
│   │   └── Chart.svelte                       # D3 bar chart component
│   ├── routes/
│   │   ├── +layout.js
│   │   ├── +layout.svelte
│   │   └── +page.svelte                       # Main article & visualization 
│   ├── app.css                                # Global styles
│   └── app.html                               # HTML shell
├── static/
│   ├── data/
│   │   └── Missing_Dead_regions_2014-2024.csv # Processed data file
│   └── favicon.png
├── Data_Cleaning_Missing_Migrants_Project.R   # R script for data cleaning
├── package.json
├── svelte.config.js
├── tsconfig.json
└── vite.config.ts

## Data

Source: [Missing Migrants Project](https://missingmigrants.iom.int) — International Organization for Migration (IOM), 2014–2024.

The R script `Data_Cleaning_Missing_Migrants_Project` handles data cleaning and aggregation from the raw Excel file into `static/data/Missing_Dead_regions_2014-2024`.

## Tech Stack

- [SvelteKit](https://kit.svelte.dev) with `@sveltejs/adapter-static`
- [D3.js](https://d3js.org) for the chart
- Playfair Display + DM Sans (Google Fonts)
- GitHub Pages for hosting

## AI disclosure 

Claude Code supported the design of the HTML page; the data-download and processing workflow; troubleshooting and refinement of the code that produces the chart. Editorial decisions, data wrangling, analysis and interpretation, as well as the writing, are the author's own.

## License

Data: © IOM Missing Migrants Project. Code: MIT.
