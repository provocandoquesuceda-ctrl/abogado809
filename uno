import { Resend } from 'resend'

const resend = new Resend(process.env.RESEND_API_KEY)

export async function enviarNotificacionConsulta({
  abogadoEmail,
  abogadoNombre,
  clienteNombre,
  clienteEmail,
  clienteTelefono,
  asunto,
  mensaje,
}: {
  abogadoEmail: string
  abogadoNombre: string
  clienteNombre: string
  clienteEmail: string
  clienteTelefono?: string
  asunto: string
  mensaje: string
}) {
  await resend.emails.send({
    from: process.env.EMAIL_FROM ?? 'Abogado809 <noreply@abogado809.com>',
    to: abogadoEmail,
    subject: `Nueva consulta: ${asunto}`,
    html: `
      <div style="font-family:sans-serif;max-width:600px;margin:0 auto">
        <div style="background:#1B2B4B;padding:24px;border-radius:8px 8px 0 0">
          <h1 style="color:#C9A84C;margin:0;font-size:22px">Abogado809</h1>
          <p style="color:#fff;margin:4px 0 0;font-size:14px">Nueva consulta recibida</p>
        </div>
        <div style="background:#f9f9f9;padding:24px;border-radius:0 0 8px 8px;border:1px solid #e5e7eb">
          <p style="color:#374151;margin:0 0 16px">Estimado/a <strong>${abogadoNombre}</strong>,</p>
          <p style="color:#374151;margin:0 0 20px">Ha recibido una nueva consulta a través de Abogado809:</p>
          
          <table style="width:100%;border-collapse:collapse">
            <tr><td style="padding:8px 0;color:#6b7280;font-size:14px;border-bottom:1px solid #e5e7eb">Cliente</td>
                <td style="padding:8px 0;font-weight:600;font-size:14px;border-bottom:1px solid #e5e7eb">${clienteNombre}</td></tr>
            <tr><td style="padding:8px 0;color:#6b7280;font-size:14px;border-bottom:1px solid #e5e7eb">Email</td>
                <td style="padding:8px 0;font-size:14px;border-bottom:1px solid #e5e7eb"><a href="mailto:${clienteEmail}" style="color:#1B2B4B">${clienteEmail}</a></td></tr>
            ${clienteTelefono ? `<tr><td style="padding:8px 0;color:#6b7280;font-size:14px;border-bottom:1px solid #e5e7eb">Teléfono</td>
                <td style="padding:8px 0;font-size:14px;border-bottom:1px solid #e5e7eb">${clienteTelefono}</td></tr>` : ''}
            <tr><td style="padding:8px 0;color:#6b7280;font-size:14px;border-bottom:1px solid #e5e7eb">Asunto</td>
                <td style="padding:8px 0;font-weight:600;font-size:14px;border-bottom:1px solid #e5e7eb">${asunto}</td></tr>
          </table>
          
          <div style="margin:20px 0;background:#fff;border-left:3px solid #C9A84C;padding:12px 16px;border-radius:0 6px 6px 0">
            <p style="color:#6b7280;font-size:12px;margin:0 0 6px;text-transform:uppercase;letter-spacing:.05em">Mensaje</p>
            <p style="color:#1f2937;margin:0;line-height:1.6">${mensaje}</p>
          </div>
          
          <p style="color:#9ca3af;font-size:12px;margin:20px 0 0">
            Este mensaje fue enviado desde Abogado809 · República Dominicana<br>
            <a href="https://abogado809.vercel.app/dashboard" style="color:#1B2B4B">Ver en tu panel →</a>
          </p>
        </div>
      </div>
    `,
  })
}
