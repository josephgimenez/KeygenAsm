
// KeygenAsmDlg.h : header file
//

#pragma once


// CKeygenAsmDlg dialog
class CKeygenAsmDlg : public CDialogEx
{
// Construction
public:
	CKeygenAsmDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	enum { IDD = IDD_KEYGENASM_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support


// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	CString m_sUserName;
	afx_msg void OnBnClickedOk();
//	CString m_sPassword;
	CString m_sPassword;
	afx_msg void OnBnClickedBexit();
};
