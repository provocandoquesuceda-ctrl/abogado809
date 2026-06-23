import Head from 'next/head'

export default function Home() {
  return (
    <>
      <Head>
        <title>abogado809</title>
        <meta name="description" content="Plataforma de abogado dominicana" />
      </Head>
      <main style={{display:'flex',alignItems:'center',justifyContent:'center',height:'100vh',flexDirection:'column'}}>
        <h1>abogado809</h1>
        <p>Aplicación mínima lista para desplegar en Vercel.</p>
      </main>
    </>
  )
}
