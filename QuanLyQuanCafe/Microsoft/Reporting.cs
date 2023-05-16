using System;
using System.Drawing;
using System.Windows.Forms;

namespace Microsoft
{
    internal class Reporting
    {
        internal class WinForms
        {
            internal class ReportViewer
            {
                public object LocalReport { get; internal set; }
                public Size Size { get; internal set; }
                public int TabIndex { get; internal set; }
                public Point Location { get; internal set; }
                public string Name { get; internal set; }

                internal void RefreshReport()
                {
                    throw new NotImplementedException();
                }
            }

            internal class ReportDataSource
            {
                public string Name { get; internal set; }
                public BindingSource Value { get; internal set; }
            }
        }
    }
}