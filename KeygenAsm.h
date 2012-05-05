
// KeygenAsm.h : main header file for the PROJECT_NAME application
//

#pragma once

#ifndef __AFXWIN_H__
	#error "include 'stdafx.h' before including this file for PCH"
#endif

#include "resource.h"		// main symbols


// CKeygenAsmApp:
// See KeygenAsm.cpp for the implementation of this class
//

class CKeygenAsmApp : public CWinApp
{
public:
	CKeygenAsmApp();

// Overrides
public:
	virtual BOOL InitInstance();

// Implementation

	DECLARE_MESSAGE_MAP()
};

extern CKeygenAsmApp theApp;