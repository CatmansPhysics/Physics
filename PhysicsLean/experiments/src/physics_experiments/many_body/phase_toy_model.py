def classify_phase(order_parameter: float, protected: bool) -> str:
    if protected:
        return "topological"
    if order_parameter > 0:
        return "ordered"
    return "disordered"