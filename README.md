# Medical-Crm
# AI-First CRM - HCP Module

An AI-powered CRM system for healthcare professional (HCP) interaction management, driven by natural language chat.

## Features

- **Natural Language Logging** — Describe your HCP interaction in chat, AI auto-fills the form
- **Smart Editing** — Say "change sentiment to Neutral" or "update name to Dr. John" to edit fields
- **5 LangGraph Tools** — log_interaction, edit_interaction, summarize, suggest_followup, search_hcp
- **Auto-submit** — Inactivity timer auto-saves after 1 minute
- **Dark Theme UI** — Modern, responsive interface with countdown timers

## Tech Stack

- **Backend:** Python, FastAPI, LangGraph, SQLAlchemy, SQLite
- **LLM:** Groq (qwen/qwen3-32b)
- **Frontend:** Vanilla HTML/CSS/JS

## Quick Start

```bash
# Backend
cd crm-backend
pip install -r requirements.txt
python -m uvicorn app.main:app --host 0.0.0.0 --port 8001

# Frontend
cd crm-frontend
python -m http.server 8000
```

Open `http://localhost:8000` in your browser.

## Usage

1. **Log interaction:** Type `Met Dr. Sarah Chen at Metro Heart Institute, discussed cardiology treatment`
2. **Edit field:** Type `change sentiment to Positive`
3. **Summarize:** Type `summarize`
4. **Search:** Type `search for cardiologists`

## Form Fields

| Field | Description |
|-------|-------------|
| HCP Name | Healthcare professional name |
| Specialty | Medical specialty |
| Hospital | Hospital/clinic name |
| Interaction Type | Meeting, Visit, Phone Call, etc. |
| Date | Interaction date |
| Sentiment | Positive, Neutral, Negative |
| Topics Discussed | Discussion topics |
| Materials Shared | Brochures, samples |
| Follow-up Actions | Next steps |
| Notes | Additional notes |

## Project Structure

```
crm-backend/
├── app/
│   ├── main.py              # FastAPI server
│   ├── agent/
│   │   └── langgraph_agent.py  # LangGraph agent
│   ├── tools/
│   │   └── crm_tools.py     # 5 CRM tools
│   ├── models.py            # SQLAlchemy models
│   ├── schemas.py           # Pydantic schemas
│   └── database.py          # SQLite config
└── requirements.txt

crm-frontend/
└── index.html               # Vanilla JS frontend
```

## License

MIT
