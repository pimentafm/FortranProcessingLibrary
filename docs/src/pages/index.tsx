import React from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import styles from './index.module.css';

interface FeatureItem {
  icon: string;
  title: string;
  description: string;
}

const features: FeatureItem[] = [
  {
    icon: '📦',
    title: 'NetCDF I/O',
    description:
      'Read and write 2D, 3D, and 4D NetCDF grids with a single call. Supports byte, short, int, float, and double data types with automatic type dispatch.',
  },
  {
    icon: '⚡',
    title: 'OpenMP Parallelism',
    description:
      'Cache-optimized column-major loop ordering with OpenMP parallelization for high-throughput processing of large geospatial datasets.',
  },
  {
    icon: '🔧',
    title: 'Simple API',
    description:
      'Generic interfaces let you call readgrid, writegrid, gengrid, and setFillValue with any type — the compiler dispatches automatically.',
  },
  {
    icon: '🧩',
    title: '100 Derived Types',
    description:
      'Combinatorial type system covering all dimension (2D–4D), precision (byte–double), and coordinate type combinations in a single module.',
  },
  {
    icon: '🛡️',
    title: 'Robust Error Handling',
    description:
      'Every allocation is checked with stat=, every NetCDF call is validated, and colored diagnostics pinpoint errors without segfaults.',
  },
  {
    icon: '🐧',
    title: 'Linux Native',
    description:
      'Auto-detecting Makefile supports Fedora, RHEL, Debian, Ubuntu and more. Compiles as a shared library (libFPL.so) for easy linking.',
  },
];

function Feature({icon, title, description}: FeatureItem): React.JSX.Element {
  return (
    <div className={styles.featureCard}>
      <div className={styles.featureIcon}>{icon}</div>
      <h3>{title}</h3>
      <p>{description}</p>
    </div>
  );
}

function HomepageHeader(): React.JSX.Element {
  return (
    <header className={styles.heroBanner}>
      <div className="container">
        <div className={styles.heroContent}>
          <img
            src="img/FPLlogo.png"
            alt="FPL Logo"
            className={styles.heroLogo}
          />
          <div className={styles.heroText}>
            <h1 className={styles.heroTitle}>
              Fortran Processing Library
            </h1>
            <p className={styles.heroSubtitle}>
              High-performance NetCDF data processing for Fortran 90 with OpenMP parallelism.
              Read, write, generate, and mask geospatial grids with a clean, type-safe API.
            </p>
            <div className={styles.heroButtons}>
              <Link
                className="button button--primary button--lg"
                to="/docs/getting-started">
                Get Started
              </Link>
              <Link
                className="button button--outline button--lg"
                to="/docs/api/datatypes">
                API Reference
              </Link>
              <Link
                className="button button--outline button--lg"
                href="https://github.com/pimentafm/FortranProcessingLibrary">
                GitHub
              </Link>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}

function CodePreview(): React.JSX.Element {
  return (
    <section className={styles.codePreview}>
      <div className="container">
        <div className="row">
          <div className={clsx('col col--6')}>
            <h2>Minimal boilerplate</h2>
            <p>
              Declare a typed structure, set the variable and dimension names,
              then call <code>readgrid</code>. FPL handles NetCDF dimension
              queries, type validation, memory allocation, and coordinate
              extraction in a single call.
            </p>
            <p>
              The same pattern works for writing (<code>writegrid</code>),
              grid generation (<code>gengrid</code>), fill-value masking
              (<code>setFillValue</code>), and memory cleanup (<code>dealloc</code>).
            </p>
            <Link
              className="button button--primary button--md"
              to="/docs/examples/ex01"
              style={{marginTop: '1rem'}}>
              Browse examples
            </Link>
          </div>
          <div className={clsx('col col--6')}>
            <div className={styles.codeBlock}>
              <div className={styles.codeHeader}>
                <span className={styles.codeDot} style={{background: '#ff5f57'}} />
                <span className={styles.codeDot} style={{background: '#febc2e'}} />
                <span className={styles.codeDot} style={{background: '#28c840'}} />
                <span className={styles.codeFilename}>example.f90</span>
              </div>
              <pre className={styles.codeContent}>{`program main
  use fpl
  implicit none

  type(nc3d_float_llf_ti) :: temp

  temp%varname  = "temperature"
  temp%lonname  = "lon"
  temp%latname  = "lat"
  temp%timename = "time"

  call readgrid("input.nc", temp)

  ! Process: Celsius → Fahrenheit
  where(temp%ncdata /= temp%FillValue)
    temp%ncdata = temp%ncdata * 1.8 + 32
  end where

  call writegrid("output.nc", temp)
  call dealloc(temp)
end program main`}</pre>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

function InstallBanner(): React.JSX.Element {
  return (
    <section className={styles.installBanner}>
      <div className="container">
        <h2>Quick Install</h2>
        <div className={styles.installSteps}>
          <div className={styles.installStep}>
            <div className={styles.stepNumber}>1</div>
            <div>
              <strong>Install dependencies</strong>
              <code className={styles.installCode}>
                sudo apt install gfortran libnetcdf-dev libnetcdff-dev make
              </code>
            </div>
          </div>
          <div className={styles.installStep}>
            <div className={styles.stepNumber}>2</div>
            <div>
              <strong>Build &amp; install</strong>
              <code className={styles.installCode}>
                git clone https://github.com/pimentafm/FortranProcessingLibrary.git && cd FortranProcessingLibrary && make && sudo make install
              </code>
            </div>
          </div>
          <div className={styles.installStep}>
            <div className={styles.stepNumber}>3</div>
            <div>
              <strong>Compile your program</strong>
              <code className={styles.installCode}>
                gfortran -o myapp myapp.f90 -I/usr/include/ -lFPL
              </code>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

export default function Home(): React.JSX.Element {
  return (
    <Layout
      title="Fortran Processing Library"
      description="High-performance NetCDF data processing library for Fortran 90 with OpenMP parallelism">
      <HomepageHeader />
      <main>
        <section className={styles.features}>
          <div className="container">
            <div className={styles.featuresGrid}>
              {features.map(({icon, title, description}, idx) => (
                <Feature key={idx} icon={icon} title={title} description={description} />
              ))}
            </div>
          </div>
        </section>
        <CodePreview />
        <InstallBanner />
      </main>
    </Layout>
  );
}
