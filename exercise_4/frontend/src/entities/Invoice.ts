export interface Invoice {
    open: boolean;
    id?: number;
    date: Date;
    amount: number;
    currency: string;
}