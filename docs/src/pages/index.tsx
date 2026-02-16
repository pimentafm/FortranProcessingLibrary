import React from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import styles from './index.module.css';

interface FeatureItem {
  title: string;
  description: string;
}

const features: FeatureItem[] = [
  {
    title: 'NetCDF I/O',
    description:
      'Read and write 2D, 3D, and 4D NetCDF (HDF5) grids with a simple, unified API supporting byte, short, int, float, and double data types.',
  },
  {
    title: 'OpenMP Parallel',
    description:
      'Cache-optimized column-major loop ordering with OpenMP parallelization for high-performance processing of large geospatial datasets.',
  },
  {
    title: 'Pure Fortran 90',
    description:
      'No external dependencies beyond NetCDF and GFortran. Compatible with any system supporting Fortran 90 and the NetCDF library.',
  },
];

function Feature({title, description}: FeatureItem): React.JSX.Element {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center padding-horiz--md" style={{paddingTop: '2rem'}}>
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

function HomepageHeader(): React.JSX.Element {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <img src="img/FPLlogo.png" alt="FPL Logo" width="120" style={{marginBottom: '1rem'}} />
        <h1 className="hero__title">{siteConfig.title}</h1>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <Link className="button button--secondary button--lg" to="/docs/getting-started">
            Get Started →
          </Link>
        </div>
      </div>
    </header>
  );
}

function HomepageFeatures(): React.JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {features.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}

export default function Home(): React.JSX.Element {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout title={siteConfig.title} description="FPL — Fortran Processing Library for NetCDF data">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}
